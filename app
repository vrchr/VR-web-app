// Minimal VR app script — spinning box + color toggle

AFRAME.registerComponent('spin', {
  schema: { speed: { type: 'number', default: 30 } },
  tick: function (t, dt) {
    this.el.object3D.rotation.y += THREE.MathUtils.degToRad(this.data.speed * dt / 1000);
  }
});

document.addEventListener('DOMContentLoaded', () => {
  const box = document.getElementById('spinningBox');
  box.setAttribute('spin', 'speed: 45');

  // Toggle color & scale
  function toggleInteract() {
    const current = box.getAttribute('color');
    const next = current === '#4CC3D9' ? '#EF2D5E' : '#4CC3D9';
    box.setAttribute('color', next);

    box.setAttribute('scale', '1.2 1.2 1.2');
    setTimeout(() => box.setAttribute('scale', '1 1 1'), 200);
  }

  // Mouse click or controller trigger
  box.addEventListener('click', toggleInteract);

  // Support controller button press
  const scene = document.querySelector('a-scene');
  scene.addEventListener('controllerbuttondown', (evt) => {
    const controller = evt.detail.target;
    if (!controller) return;

    const origin = new THREE.Vector3();
    const dir = new THREE.Vector3(0, 0, -1);
    controller.object3D.getWorldPosition(origin);
    controller.object3D.getWorldDirection(dir);

    const ray = new THREE.Raycaster(origin, dir);
    const intersects = ray.intersectObject(box.object3D, true);
    if (intersects.length) toggleInteract();
  });

  console.log('VR app ready.');
});
