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

document.addEventListener('DOMContentLoaded', () => {
  initNav();
});
