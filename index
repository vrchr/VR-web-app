<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width,initial-scale=1"/>
  <title>Minimal WebVR App</title>

  <!-- A-Frame (WebXR) -->
  <script src="https://aframe.io/releases/1.4.2/aframe.min.js"></script>

  <style>
    body { margin:0; font-family: system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue"; }
    .info { 
      position: absolute; left: 12px; top: 12px; 
      background: rgba(0,0,0,0.5); color: white; 
      padding: 8px 12px; border-radius: 8px;
    }
  </style>
</head>
<body>
  <div class="info">
    Press the VR button (bottom-right) to enter VR.  
    Click or trigger the cube to interact.
  </div>

  <a-scene background="color: #111" embedded>
    <!-- Camera + cursor -->
    <a-entity id="cameraRig">
      <a-entity camera look-controls position="0 1.6 3">
        <a-entity cursor="fuse: false; rayOrigin: mouse" raycaster="objects: .interactive"
                  position="0 0 -1" geometry="primitive: ring; radiusInner: 0.01; radiusOuter: 0.02"
                  material="color: white; shader: flat"></a-entity>
      </a-entity>
    </a-entity>

    <!-- Ground -->
    <a-plane rotation="-90 0 0" width="20" height="20" color="#222"></a-plane>

    <!-- Interactive cube -->
    <a-box id="spinningBox" class="interactive" position="0 1.25 -2"
           depth="0.8" height="0.8" width="0.8" color="#4CC3D9" shadow></a-box>

    <!-- Lighting -->
    <a-entity light="type: ambient; intensity: 0.5"></a-entity>
    <a-entity light="type: directional; intensity: 0.8" position="0 4 1"></a-entity>

    <!-- Controllers -->
    <a-entity laser-controls="hand: left"></a-entity>
    <a-entity laser-controls="hand: right"></a-entity>

    <!-- Load app logic -->
    <script src="app.js"></script>
  </a-scene>
</body>
</html>
