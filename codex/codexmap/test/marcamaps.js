(function($){
    $.fn.marcaMap = function(params) {
        var defaults = {
            'maphilighted': "div.maphilighted",
            'initialzoom': 0,
            'controlshtml': "<div id='controls'><div id='zoomin'>+</div><div id='zoomout'>-</div></div>",
            'prevbcksize': 0,
            'animate': 0,
            'animatezoom': 0,
            'animatespeed': 500,
            'onzoomchange': function(zoomlevel){},
            'autogenerate': 'zoom3'
        }
                
        var opts = $.extend(defaults, params);        
        
        opts.container.css('opacity', '0');
        
        if(!opts.maxzoom){
            opts.maxzoom = opts.img.width();
        }else{
            if(opts.autogenerate){
                opts.container.find('map[name='+opts.autogenerate+']').data('autogenerate', true);;
            }
        }
        
        opts.imgorginalwidth = opts.img.width();
        opts.initialwidth = opts.container.width();
        
        opts.zoomlevels = opts.container.find('map').length-1;
        opts.zoomlevel = (opts.maxzoom - opts.initialwidth) / opts.zoomlevels;
        
        opts.img.attr({
            'zoom': opts.initialzoom,
            'usemap': "#zoom"+opts.initialzoom
        }).css('width', opts.initialwidth);
        
        opts.container.append(opts.controlshtml);
        if(opts.autogenerate){
            var map = opts.container.find('map[name='+opts.autogenerate+']')
            if(map.data('ajaxsource') != false){
                map.data('loaded', true);
                $.get(map.data('ajaxsource'), function(data) {
                  map.html(data);
                  init();
                }, 'html');                
            }else{
                init();
            }
        }else{       
            init();
        }
        
        function init(x, y){
            opts.container.css('opacity', '1');
            var initmap = function(){
                var newidth = opts.initialwidth + opts.img.attr('zoom') * opts.zoomlevel;
                if(x == undefined){
                    var dragleft = parseInt(opts.drag.css('left').replace('px', ''));
                    var dragtop = parseInt(opts.drag.css('top').replace('px', ''));
                    if(!isNaN(dragtop)){
                        y = (opts.container.height() / 2 ) - dragtop
                        x = (opts.container.width() / 2 ) - dragleft
                    }
                }
                
                if(x != undefined){
                    var por = (x / opts.img.width()) * 100;          
                    var porh = (y / opts.img.height()) * 100; 
                }
                
                //reset maphilight
                opts.container.find("canvas").remove();
                opts.img.attr('style', '');
                $(opts.maphilighted).attr('style', '');            
                opts.img.css('width', newidth);
                var newheight = opts.img.height();
                var rpor = (por * newidth) / 100;
                var lpor = (porh * newheight) / 100;
                
                //generate areas                
                if(opts.autogenerate){
                    if(!map.data('autogenerate')){
                        map.data('autogenerate', true);
                        var pr = (newidth/opts.imgorginalwidth)*100;
                        var areas = opts.container.find('map[name='+opts.autogenerate+'] area');
                        var cords = '';
                        var cords_array = new Array();
                        var html_areas = '';
                        for (var i = 0; i < areas.length; i++){
                                cords = $(areas[i]).attr('coords').split(',');
                                cords_array = new Array();
                                for(var z = 0; z < cords.length; z++){
                                    cords_array.push(cords[z]*pr/100);
                                }
                                cords = cords_array.join(',');
                                html_areas += "<area coords='"+cords+"' shape='poly'>";
                        }
                        map.html(html_areas);
                    }
                }              
                
                //drag
                var x1 = -(opts.img.width() - opts.container.width()+10);
                var y1 = -(opts.img.height() - opts.container.height()+10);
                $(opts.drag).draggable({ 
                    containment: [x1, y1, 28, 28]
                });            
                
                //init maphilight
                $(opts.img).maphilight();
                opts.container.find("canvas").hide();

                var maphilighted = $(opts.maphilighted);
                maphilighted.css({
                    "background-size": opts.prevbcksize[0]
                });   
                
                var left = 0;
                var top = 0;
                
                if(x != undefined){
                    var half = opts.container.width()/2;
                    var halfv = opts.container.height()/2;
                    left = half-rpor; 
                    top = halfv-lpor;
                    
                    if(left < x1){
                        left = x1;
                    }else{
                        if(left > 0){
                            left = 28;
                        }
                    }
                    
                    if(top < y1){
                        top = y1;
                    }else{
                        if(top > 28){
                            top = 28;
                        }
                    }
                }

                //change zoom
                if(opts.prevbcksize && opts.animatezoom){                                        
                    maphilighted.css({
                        "background-repeat": 'no-repeat'
                    })
                    .animate({
                        "background-size": newidth
                    }, opts.animatespeed, function(){
                        opts.animate = 0;
                        opts.container.find("canvas").show();
                    });
                    
                    opts.drag.animate({
                        "top": top,
                        "left": left
                    }, opts.animatespeed);
                    
                }else{
                    maphilighted.css({
                        "background-repeat": 'no-repeat',
                        "background-size": newidth
                    });
                    
                    opts.drag.css({
                        "top": top,
                        "left": left
                    });
                    
                    opts.container.find("canvas").show();
                    opts.animate = 0;
                }
                opts.prevbcksize = new Array(newidth, newheight);
                opts.onzoomchange(opts.img.attr('zoom'));
            }
            
            opts.animate = 1;

            //load local/remote usemap
            var usemap = opts.img.attr('usemap').replace("#", "");
            var map = opts.container.find('map[name='+usemap+']');
            
            if(map.data('ajaxsource') != false){
                if(!map.data('loaded')){
                    map.data('loaded', true);
                    $.get(map.data('ajaxsource'), function(data) {
                      map.html(data);
                      initmap();
                    }, 'html');
                }else initmap();
            }else initmap();
        }
        
        //events
        $("#zoomin").click(function(){
            if(opts.animate) return false;
            
            var zoom = opts.img.attr('zoom');
            if(zoom<opts.zoomlevels){
                zoom++;
            }else return false;

            opts.img.attr({
                'zoom': zoom,
                'usemap': "#zoom"+zoom
            });         
            
            init();
        });
        
        $("#zoomout").click(function(){
            if(opts.animate) return false;
            
            var zoom = opts.img.attr('zoom');
            if(zoom>0){
                zoom--;  
            }else return false;
            
            opts.img.attr({
                'zoom': zoom,
                'usemap': "#zoom"+zoom
            });
            
            init();
        });        

        $(opts.drag).bind('mousewheel', function(event, delta) {
            if(opts.animate) return false;
            
            var zoom = opts.img.attr('zoom');
            if(delta>0){
                if(zoom<opts.zoomlevels){
                    zoom++;
                }else return false;
            }else{
                if(zoom>0){
                    zoom--;  
                }else return false;
            }

            var y = event.pageY - opts.img.offset().top;
            var x = event.pageX - opts.img.offset().left;


            opts.img.attr({
                'zoom': zoom,
                'usemap': "#zoom"+zoom
            });            
            
            init(x, y);
        });     
    };
})(jQuery);
