Queriac Changelog
=================

2012-08-29
----------

- The [new js engine](https://queriac2.herokuapp.com/engine) handles funny characters.
- Protocol, host, and port are no longer hardcoded, but [inferred from rail's request object](https://github.com/zeke/queriac2/blob/f555fb0137fab0451a00d9c9efb9f973e41a53b1/app/controllers/static_controller.rb#L16-19).
- Named parameters are now supported, and can work in conjunction with positional parameters: https://queriac2.herokuapp.com/v2?q=g%20dog%20food%20user:bob%20count:0
- New [help page](https://queriac2.herokuapp.com/help).
- The command#show page now shows the script and description: https://queriac2.herokuapp.com/users/zeke/commands/ish
- Removed Ace.js in favor of CodeMirror