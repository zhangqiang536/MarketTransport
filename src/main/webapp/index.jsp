<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>사랑 해, 너 혹시 하세요</title>	    

        <link type="text/css" rel="stylesheet" href="files/default.css">

		<script type="text/javascript" src="files/jquery.js"></script>

		<script type="text/javascript" src="files/jscex.js"></script>

		<script type="text/javascript" src="files/jscex-parser.js"></script>

		<script type="text/javascript" src="files/jscex-jit.js"></script>

		<script type="text/javascript" src="files/jscex-builderbase.js"></script>

		<script type="text/javascript" src="files/jscex-async.js"></script>

		<script type="text/javascript" src="files/jscex-async-powerpack.js"></script>

		<script type="text/javascript" src="files/functions.js" charset="utf-8"></script>

		<script type="text/javascript" src="files/love.js" charset="utf-8"></script>

	    <style type="text/css">

<!--

.STYLE1 {color: #666666}

-->
			#main{
				position:absolute
			}

			.love{
				position:relative;
				margin:left;
				height:10px;
				weight:10px;
			}
			
			.aaaaa{
				margin-bottom: 20px;

				
			}
        </style>

</head>

    <body>

			<audio autoplay="autopaly">

					<source src="files/toYMH.mp3" type="audio/mp3">

			</audio>  

        <div id="main">

            <div id="error">本页面采用HTML5编辑，目前您的浏览器无法显示，请换成谷歌(<a href="http://www.google.cn/chrome/intl/zh-CN/landing_chrome.html?hl=zh-CN&amp;brand=CHMI">Chrome</a>)或者火狐(<a href="http://firefox.com.cn/download/">Firefox</a>)浏览器，或者其他游览器的最新版本。</div>

             <div id="wrap">
				
                <div id="text" class="aaaaa">

			        <div id="code">

						<font color="#FF0000">
							<span class="say">缘是美丽的邂逅，爱是心跳的感觉，情是心灵的交会，恋是甜蜜的思念，</span><br>
							<span class="say">走在爱与被爱的边缘，你见或者不见，爱你的心始终不改变！</span><br>
							<span class="say"><img src="imgs/lyx.jpg" width="70px" height="70px" />认识你很开心！！</span><br>
							<span class="say"><span class="space"></span></span>
						</font><p></p>

					</div>

                </div>
                <canvas id="canvas" width="1100" height="680"></canvas>

            </div>
			
            

        </div>

    

    <script>

    </script>



    <script>

    (function(){

        var canvas = $('#canvas');

		

        if (!canvas[0].getContext) {

            $("#error").show();

            return false;        }



        var width = canvas.width();

        var height = canvas.height();        

        canvas.attr("width", width);

        canvas.attr("height", height);

        var opts = {

            seed: {

                x: width / 2 - 20,

                color: "rgb(190, 26, 37)",

                scale: 2

            },

            branch: [

                [535, 680, 570, 250, 500, 200, 30, 100, [

                    [540, 500, 455, 417, 340, 400, 13, 100, [

                        [450, 435, 434, 430, 394, 395, 2, 40]

                    ]],

                    [550, 445, 600, 356, 680, 345, 12, 100, [

                        [578, 400, 648, 409, 661, 426, 3, 80]

                    ]],

                    [539, 281, 537, 248, 534, 217, 3, 40],

                    [546, 397, 413, 247, 328, 244, 9, 80, [

                        [427, 286, 383, 253, 371, 205, 2, 40],

                        [498, 345, 435, 315, 395, 330, 4, 60]

                    ]],

                    [546, 357, 608, 252, 678, 221, 6, 100, [

                        [590, 293, 646, 277, 648, 271, 2, 80]

                    ]]

                ]] 

            ],

            bloom: {

                num: 700,

                width: 1080,

                height: 650,

            },

            footer: {

                width: 1200,

                height: 5,

                speed: 10,

            }

        }



        var tree = new Tree(canvas[0], width, height, opts);

        var seed = tree.seed;

        var foot = tree.footer;

        var hold = 1;



        canvas.click(function(e) {

            var offset = canvas.offset(), x, y;

            x = e.pageX - offset.left;

            y = e.pageY - offset.top;

            if (seed.hover(x, y)) {

                hold = 0; 

                canvas.unbind("click");

                canvas.unbind("mousemove");

                canvas.removeClass('hand');

            }

        }).mousemove(function(e){

            var offset = canvas.offset(), x, y;

            x = e.pageX - offset.left;

            y = e.pageY - offset.top;

            canvas.toggleClass('hand', seed.hover(x, y));

        });



        var seedAnimate = eval(Jscex.compile("async", function () {

            seed.draw();

            while (hold) {

                $await(Jscex.Async.sleep(10));

            }

            while (seed.canScale()) {

                seed.scale(0.95);

                $await(Jscex.Async.sleep(10));

            }

            while (seed.canMove()) {

                seed.move(0, 2);

                foot.draw();

                $await(Jscex.Async.sleep(10));

            }

        }));



        var growAnimate = eval(Jscex.compile("async", function () {

            do {

    	        tree.grow();

                $await(Jscex.Async.sleep(10));

            } while (tree.canGrow());

        }));



        var flowAnimate = eval(Jscex.compile("async", function () {

            do {

    	        tree.flower(2);

                $await(Jscex.Async.sleep(10));

            } while (tree.canFlower());

        }));



        var moveAnimate = eval(Jscex.compile("async", function () {

            tree.snapshot("p1", 240, 0, 610, 680);

            while (tree.move("p1", 500, 0)) {

                foot.draw();

                $await(Jscex.Async.sleep(10));

            }

            foot.draw();

            tree.snapshot("p2", 500, 0, 610, 680);



            // 会有闪烁不得意这样做, (＞﹏＜)

            canvas.parent().css("background", "url(" + tree.toDataURL('image/png') + ")");

            canvas.css("background", "#ffe");

            $await(Jscex.Async.sleep(300));

            canvas.css("background", "none");

        }));



        var jumpAnimate = eval(Jscex.compile("async", function () {

            var ctx = tree.ctx;

            while (true) {

                tree.ctx.clearRect(0, 0, width, height);

                tree.jump();

                foot.draw();

                $await(Jscex.Async.sleep(25));

            }

        }));



        var textAnimate = eval(Jscex.compile("async", function () {

		    var together = new Date();

		    together.setFullYear(2016,2, 25); 			//时间年月日

		    together.setHours(15);						//小时	

		    together.setMinutes(4);					//分钟

		    together.setSeconds(2);					//秒前一位

		    together.setMilliseconds(8);				//秒第二位



		    $("#code").show().typewriter();

            $("#clock-box").fadeIn(500);

            while (true) {

                timeElapse(together);

                $await(Jscex.Async.sleep(1000));

            }

        }));



        var runAsync = eval(Jscex.compile("async", function () {

            $await(seedAnimate());

            $await(growAnimate());

            $await(flowAnimate());

            $await(moveAnimate());



            textAnimate().start();



            $await(jumpAnimate());

        }));



        runAsync().start();

    })();

    </script>
	<!-- 爱心start -->
	<div clsss="love">
	
		<script src="2/nb.js"></script>

		<script src="2/Projector.js"></script>
		<script src="2/CanvasRenderer.js"></script>

		<script src="2/tween.min.js"></script>
		<script src="2/Sparks.js"></script>

		<!-- load the font file from canvas-text -->

		<script src="2/helvetiker_regular.typeface.js"></script>


		<script>

			var container;

			var camera, scene, renderer;

			var group, text, plane;

			var targetRotation = 0;
			var targetRotationOnMouseDown = 0;

			var mouseX = 0;
			var mouseXOnMouseDown = 0;

			var windowHalfX = window.innerWidth / 2;
			var windowHalfY = window.innerHeight / 2;

			var heartShape, particleCloud, sparksEmitter, emitterPos;
			var _rotation = 0;
			var timeOnShapePath = 0;

			init();
			animate();

			function init() {

				container = document.createElement( 'div' );
				document.body.appendChild( container );


                //相机
				camera = new THREE.PerspectiveCamera( 50, window.innerWidth / window.innerHeight, 1, 1000);
				camera.position.set( 0, 150, 800 );

                //场景
				scene = new THREE.Scene();

				group = new THREE.Group();
				scene.add( group );

				// Get text from hash

				var string = "LOVE U";
				var hash = document.location.hash.substr( 1 );

				if ( hash.length !== 0 ) {

					string = hash;

				}

				var text3d = new THREE.TextGeometry( string, {

					size: 80,
					height: 20,
					curveSegments: 2,
					font: "helvetiker"

				});

				text3d.computeBoundingBox();
				var centerOffset = -0.5 * ( text3d.boundingBox.max.x - text3d.boundingBox.min.x );

				var textMaterial = new THREE.MeshBasicMaterial( { color: Math.random() * 0xffffff, overdraw: 0.5 } );

				text = new THREE.Mesh( text3d, textMaterial );

				// Potentially, we can extract the vertices or faces of the text to generate particles too.
				// Geo > Vertices > Position

				text.position.x = centerOffset;
				text.position.y = 100;
				text.position.z = 0;

				text.rotation.x = 0;
				text.rotation.y = Math.PI * 2;

				group.add( text );


				particleCloud = new THREE.Object3D(); // Just a group
				particleCloud.y = 800;
				group.add( particleCloud );

				// Create Particle Systems

				// Heart

				var x = 0, y = 0;

				heartShape = new THREE.Shape();

				heartShape.moveTo( x + 25, y + 25 );
				heartShape.bezierCurveTo( x + 25, y + 25, x + 20, y, x, y );
				heartShape.bezierCurveTo( x - 30, y, x - 30, y + 35,x - 30,y + 35 );
				heartShape.bezierCurveTo( x - 30, y + 55, x - 10, y + 77, x + 25, y + 95 );
				heartShape.bezierCurveTo( x + 60, y + 77, x + 80, y + 55, x + 80, y + 35 );
				heartShape.bezierCurveTo( x + 80, y + 35, x + 80, y, x + 50, y );
				heartShape.bezierCurveTo( x + 35, y, x + 25, y + 25, x + 25, y + 25 );

				var hue = 0;

				var hearts = function ( context ) {

					context.globalAlpha = 0.5;
					var x = 0, y = 0;
					context.scale(0.05, -0.05); // Scale so canvas render can redraw within bounds
					context.beginPath();
					 // From http://blog.burlock.org/html5/130-paths
					context.bezierCurveTo( x + 2.5, y + 2.5, x + 2.0, y, x, y );
					context.bezierCurveTo( x - 3.0, y, x - 3.0, y + 3.5,x - 3.0,y + 3.5 );
					context.bezierCurveTo( x - 3.0, y + 5.5, x - 1.0, y + 7.7, x + 2.5, y + 9.5 );
					context.bezierCurveTo( x + 6.0, y + 7.7, x + 8.0, y + 5.5, x + 8.0, y + 3.5 );
					context.bezierCurveTo( x + 8.0, y + 3.5, x + 8.0, y, x + 5.0, y );
					context.bezierCurveTo( x + 3.5, y, x + 2.5, y + 2.5, x + 2.5, y + 2.5 );
					context.fill();
					context.lineWidth = 0.5; //0.05
					context.stroke();


				}

				var setTargetParticle = function() {

					var material = new THREE.SpriteCanvasMaterial( {
						program: hearts
					} );

					material.color.setHSL(hue, 1, 0.75);
					hue += 0.001;
					if (hue>1) hue-=1;

					particle = new THREE.Sprite( material );

					particle.scale.x = particle.scale.y = Math.random() * 40 + 40;
					particleCloud.add( particle );

					return particle;

				};

				var onParticleCreated = function( p ) {

					p.target.position.copy( p.position );

				};

				var onParticleDead = function( particle ) {

					particle.target.visible = false;
					particleCloud.remove( particle.target );

				};

				sparksEmitter = new SPARKS.Emitter(new SPARKS.SteadyCounter(160));

				emitterpos = new THREE.Vector3();

				sparksEmitter.addInitializer(new SPARKS.Position( new SPARKS.PointZone( emitterpos ) ) );
				sparksEmitter.addInitializer(new SPARKS.Lifetime(0,2));
				sparksEmitter.addInitializer(new SPARKS.Target(null, setTargetParticle));

				sparksEmitter.addInitializer(new SPARKS.Velocity(new SPARKS.PointZone(new THREE.Vector3(0,-50,10))));

				// TOTRY Set velocity to move away from centroid

				sparksEmitter.addAction(new SPARKS.Age());
				//sparksEmitter.addAction(new SPARKS.Accelerate(0.2));
				sparksEmitter.addAction(new SPARKS.Move());
				sparksEmitter.addAction(new SPARKS.RandomDrift(50,50,2000));

				sparksEmitter.addCallback("created", onParticleCreated);
				sparksEmitter.addCallback("dead", onParticleDead);
				sparksEmitter.addCallback("updated", function( particle ) {

					particle.target.position.copy( particle.position );

				});

				sparksEmitter.start();

				// End Particles


				renderer = new THREE.CanvasRenderer();
				renderer.setClearColor( 0xf0f0f0 );
				renderer.setPixelRatio( window.devicePixelRatio );
				renderer.setSize( window.innerWidth/2, window.innerHeight/2 );
				container.appendChild( renderer.domElement );

				document.addEventListener( 'mousedown', onDocumentMouseDown, false );
				document.addEventListener( 'touchstart', onDocumentTouchStart, false );
				document.addEventListener( 'touchmove', onDocumentTouchMove, false );

				//

				window.addEventListener( 'resize', onWindowResize, false );

			}

			function onWindowResize() {

				windowHalfX = window.innerWidth / 2;
				windowHalfY = window.innerHeight / 2;

				camera.aspect = window.innerWidth / window.innerHeight;
				camera.updateProjectionMatrix();

				renderer.setSize( window.innerWidth, window.innerHeight );

			}

			//

			document.addEventListener( 'mousemove', onDocumentMouseMove, false );

			function onDocumentMouseDown( event ) {

				event.preventDefault();

				mouseXOnMouseDown = event.clientX - windowHalfX;
				targetRotationOnMouseDown = targetRotation;

				if ( sparksEmitter.isRunning() ) {

					sparksEmitter.stop();

				} else {

					sparksEmitter.start();

				}

			}

			function onDocumentMouseMove( event ) {

				mouseX = event.clientX - windowHalfX;

				targetRotation = targetRotationOnMouseDown + ( mouseX - mouseXOnMouseDown ) * 0.02;

			}

			function onDocumentTouchStart( event ) {

				if ( event.touches.length == 1 ) {

					event.preventDefault();

					mouseXOnMouseDown = event.touches[ 0 ].pageX - windowHalfX;
					targetRotationOnMouseDown = targetRotation;

				}

			}

			function onDocumentTouchMove( event ) {

				if ( event.touches.length == 1 ) {

					event.preventDefault();

					mouseX = event.touches[ 0 ].pageX - windowHalfX;
					targetRotation = targetRotationOnMouseDown + ( mouseX - mouseXOnMouseDown ) * 0.05;

				}

			}

			//

			function animate() {//更新场景

				requestAnimationFrame( animate );

				render();

			}

			function render() {

				timeOnShapePath += 0.0337;

				if (timeOnShapePath > 1) timeOnShapePath -= 1;

				// TODO Create a PointOnShape Action/Zone in the particle engine
				var pointOnShape = heartShape.getPointAt( timeOnShapePath );

				emitterpos.x = pointOnShape.x * 5 - 100;
				emitterpos.y = -pointOnShape.y * 5 + 400;

				// Pretty cool effect if you enable this
				// particleCloud.rotation.y += 0.05;

				group.rotation.y += ( targetRotation - group.rotation.y ) * 0.05;
				renderer.render( scene, camera );
			}

		</script></div>
	 <!-- 爱心end -->
</body></html>