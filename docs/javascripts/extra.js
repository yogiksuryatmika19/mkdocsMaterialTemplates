document.addEventListener("DOMContentLoaded", function () {
    const tocLinks = document.querySelectorAll(".md-nav__link");

    tocLinks.forEach((link) => {
        link.addEventListener("click", function () {
            const hash = this.getAttribute("href");
            if (!hash || !hash.startsWith("#")) return;

            const target = document.querySelector(hash);
            if (!target) return;

            // reset animation
            target.classList.remove("toc-highlight");

            // force reflow (WAJIB supaya animation bisa restart)
            void target.offsetWidth;

            // trigger ulang
            target.classList.add("toc-highlight");
        });
    });
});
