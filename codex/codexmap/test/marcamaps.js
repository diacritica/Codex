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
            'onzoomchange': function(zoomlevel){}
        }
        
        var opts = $.extend(defaults, params);        
        
        if(!opts.maxzoom){
            opts.maxzoom = $(opts.img).width();
        }
        
        opts.initialwidth = $(opts.container).width();
        
        opts.zoomlevels = opts.container.find('map').length-1;
        opts.zoomlevel = (opts.maxzoom - opts.initialwidth) / opts.zoomlevels;
        
        opts.img.attr({
            'zoom': opts.initialzoom,
            'usemap': "#zoom"+opts.initialzoom
        });
        
        opts.container.append(opts.controlshtml);
        
        init();
        
        function init(){
            var initmap = function(){
                //reset maphilight
                opts.container.find("canvas").remove();
                opts.img.attr('style', '');
                $(opts.maphilighted).attr('style', '');            
                
                var newidth = opts.initialwidth + opts.img.attr('zoom') * opts.zoomlevel;
                
                opts.img.css('width', newidth);
                
                var newheight = opts.img.height();
                
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
                
                var top_map = parseInt(opts.drag.css('top').replace('px', ''));
                var left_map = parseInt(opts.drag.css('left').replace('px', ''));
                
                if(top_map < y1) var top = y1;
                else var top = top_map;  
                
                if(left_map < x1) var left = x1;
                else var left = left_map;                  

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
                    
                    setTimeout(function(){
                        opts.drag.animate({
                            "top": top,
                            "left": left
                        }, opts.animatespeed);
                    }, opts.animatespeed/4);
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
            
            opts.img.attr({
                'zoom': zoom,
                'usemap': "#zoom"+zoom
            });            
            
            init();
        });     
    };
})(jQuery);
