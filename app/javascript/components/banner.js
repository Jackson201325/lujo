import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  const bannerText = document.getElementById("#banner-typed-text");
  if (bannerText) {
    new Typed('#banner-typed-text', {
      strings: ["unique", "bold", "outstanding", "interesting"],
      typeSpeed: 50,
      loop: false,
    });
  }
}

export { loadDynamicBannerText };
