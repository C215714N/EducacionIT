const
    d = document,
    w = window,
    // contact map
    mapBtn = d.querySelector('#footer [class*="map-"]');
    mapFrm = d.querySelector('#footer .map'),

mapBtn.addEventListener('click', () => 
    mapFrm.classList.toggle('active') ?
    mapBtn.classList.replace('map-open','map-close') :
    mapBtn.classList.replace('map-close', 'map-open')
);