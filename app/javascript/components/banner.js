import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["unique", "bold", "outstanding", "interesting"],
    typeSpeed: 50,
    loop: false,
  });
}

export { loadDynamicBannerText };