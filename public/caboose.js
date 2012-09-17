Zepto(
  function($) {  
    _s=document.createElement('script');
    _s.src='BASE_URL/v3?q=%s';
    document.getElementsByTagName('body')[0].appendChild(_s);
  }
);