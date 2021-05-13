function _puffer_fish_key_bindings --on-variable fish_key_bindings
    if test "$fish_key_bindings" = fish_default_key_bindings
        set modes default insert
    else
        set modes insert default
    end

    bind --mode $mode[1] . _puffer_fish_expand_dots
    bind --mode $mode[1] ! _puffer_fish_expand_bang
    bind --mode $mode[2] --erase . !
end

_puffer_fish_key_bindings

set -l uninstall_event (basename (status -f) .fish)_uninstall

function $uninstall_event --on-event $uninstall_event
    bind -e .
    bind -e !
end
