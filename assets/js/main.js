/* Maddie Burke — portfolio
   One file, no dependencies, loaded with defer on every page.

   Every init guards against its element being absent, because this script
   runs on all pages and not every page has every component. */

function initNav() {
  const nav = document.querySelector('[data-nav]');
  if (!nav) return;

  const toggle = nav.querySelector('.nav__toggle');
  if (!toggle) return;

  const setOpen = (isOpen) => {
    nav.dataset.open = String(isOpen);
    toggle.setAttribute('aria-expanded', String(isOpen));
  };

  toggle.addEventListener('click', () => {
    setOpen(toggle.getAttribute('aria-expanded') !== 'true');
  });

  /* Escape closes the menu and returns focus to the button that opened it,
     so a keyboard user is never stranded inside a menu that just vanished. */
  nav.addEventListener('keydown', (event) => {
    if (event.key === 'Escape' && toggle.getAttribute('aria-expanded') === 'true') {
      setOpen(false);
      toggle.focus();
    }
  });

  /* Crossing into the desktop layout: CSS shows the links regardless of the
     button's state, so without this the button would keep reporting
     aria-expanded="false" while the menu is plainly visible. */
  const desktop = window.matchMedia('(min-width: 600px)');
  const syncToViewport = () => { if (desktop.matches) setOpen(false); };
  desktop.addEventListener('change', syncToViewport);
  syncToViewport();
}



function initLightbox() {
  const gallery = document.querySelector('[data-gallery]');
  const dialog = document.getElementById('lightbox');

  /* No gallery, no dialog, or a browser without <dialog>: leave the links
     alone. They point at the full-size image, so they still work. */
  if (!gallery || !dialog || typeof dialog.showModal !== 'function') return;

  const links = Array.from(gallery.querySelectorAll('.gallery__link'));
  if (!links.length) return;

  const image = dialog.querySelector('[data-lb="image"]');
  const caption = dialog.querySelector('[data-lb="caption"]');
  let index = 0;

  const show = (next) => {
    index = (next + links.length) % links.length;   /* wraps both ways */
    const link = links[index];
    const thumb = link.querySelector('img');
    image.src = link.href;
    image.alt = thumb ? thumb.alt : '';
    caption.textContent = (index + 1) + ' of ' + links.length;
  };

  links.forEach((link, i) => {
    link.addEventListener('click', (event) => {
      event.preventDefault();
      show(i);
      dialog.showModal();
    });
  });

  dialog.querySelector('[data-lb="prev"]').addEventListener('click', () => show(index - 1));
  dialog.querySelector('[data-lb="next"]').addEventListener('click', () => show(index + 1));
  dialog.querySelector('[data-lb="close"]').addEventListener('click', () => dialog.close());

  dialog.addEventListener('keydown', (event) => {
    if (event.key === 'ArrowLeft')  { event.preventDefault(); show(index - 1); }
    if (event.key === 'ArrowRight') { event.preventDefault(); show(index + 1); }
  });

  /* Clicking the backdrop closes. The dialog fills the viewport, so a click
     landing on the element itself rather than its contents is a backdrop
     click. */
  dialog.addEventListener('click', (event) => {
    if (event.target === dialog) dialog.close();
  });
}

document.addEventListener('DOMContentLoaded', () => {
  initNav();
  initLightbox();
});
