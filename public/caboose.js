Zepto(
  function($) {
    _s=document.createElement('script');
    _s.type='text/javascript';
    _s.src='BASE_URL/v2?q=%s';
    document.getElementsByTagName('head')[0].appendChild(_s);
    void(0);
  }
);