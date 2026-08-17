use Mojo::Base 'openQAcoretest';
use testapi;
use utils qw(wait_for_desktop clear_root_console);

sub run {
    assert_script_run 'systemctl status --no-pager openqa-worker@1 | grep --color -z "active (running)"';
    script_run('dmesg -D'); # workaround for bsc#1217397
    save_screenshot;
    clear_root_console;
}

1;
