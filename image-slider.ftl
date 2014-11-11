<script>
		
	function getSliderWidth${randomNamespace}() {
		var columnSelector = ".portlet-column"; // defines the width of the div
		var slider${randomNamespace} = AUI().one('#knoell-carousel-${randomNamespace}');
		var width = slider${randomNamespace}.ancestor(columnSelector).width();
		console.log(width);
		return width;
	}

    function renderSlider${randomNamespace}() {
        AUI({ filter: 'raw' }).use('aui-carousel', function(A) {
            new A.Carousel({
                intervalTime:${intervaltime.getData()},
                contentBox: '#knoell-carousel-${randomNamespace}',
                activeIndex:0,
                height:${containerhight.getData()},
                width: getSliderWidth${randomNamespace}()
            }).render();
        });
		
		setWidth${randomNamespace}();
				
    };
	
	function setWidth${randomNamespace}() {
		var slider${randomNamespace} = AUI().one('#knoell-carousel-${randomNamespace}');
		var width = getSliderWidth${randomNamespace}();
		slider${randomNamespace}.setStyle("width",width+"px");
    	slider${randomNamespace}.all('.carousel-item').setStyle("width",width+"px");
		slider${randomNamespace}.ancestor('div').setStyle("width",width+"px");
	}
    
    AUI().ready( function() {
		
    	/* set the mobile class on resize */
    	AUI().use('event-resize', function(A) {
    	    
    		AUI().one(window).on('resize', function(event) {
				setWidth${randomNamespace}();
    		});
    	});
    	
    	// initial render
    	renderSlider${randomNamespace}();
    	
    });

</script>

<#if images.getSiblings()?has_content>
    <div id="knoell-carousel-${randomNamespace}" style="width:1px; margin-left: auto; margin-right: auto;">
        <#list images.getSiblings() as cur_images>
         
            <#if cur_images.imagelink.getData() != "">
                <a href="${cur_images.imagelink.getData()}">
            </#if>
            <#if cur_images.imagelink.getData() == "">
                <a href="${cur_images.imagelink2.getData()}">
            </#if>
                
                <div class="carousel-item" style="background: url(${cur_images.getData()}); width:1px; height:${containerhight.getData()}px;" class="carousel-item">
                </div>
            </a>
        
        </#list>
    </div>
</#if>