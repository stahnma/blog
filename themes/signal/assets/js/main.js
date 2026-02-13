document.addEventListener('DOMContentLoaded', function () {
  document.querySelectorAll('pre').forEach(function (pre) {
    if (pre.scrollHeight <= pre.clientHeight) return;

    var wrap = document.createElement('div');
    wrap.className = 'pre-scroll-wrap';
    pre.parentNode.insertBefore(wrap, pre);
    wrap.appendChild(pre);

    var fade = document.createElement('div');
    fade.className = 'scroll-fade';
    fade.textContent = '↓ scroll';
    wrap.appendChild(fade);

    pre.addEventListener('scroll', function () {
      var atBottom = pre.scrollTop + pre.clientHeight >= pre.scrollHeight - 4;
      wrap.classList.toggle('scrolled-bottom', atBottom);
    });
  });
});
