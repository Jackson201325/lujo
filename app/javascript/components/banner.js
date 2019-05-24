import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["unique", "bold", "outstanding"],
    typeSpeed: 50,
    loop: true,
  });
}

export { loadDynamicBannerText };