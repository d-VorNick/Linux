
%post -p /bin/sh
yum remove -y nano:
exit 0


%attr(0755, root, root) "/usr/bin/nano"
%attr(0777, root, root) "/usr/bin/rnano"
%dir %attr(0755, root, root) "/usr/lib/.build-id"
%dir %attr(0755, root, root) "/usr/lib/.build-id/d3"
%attr(0777, root, root) "/usr/lib/.build-id/d3/2b98652aa5da556eb5050b473e969e2346df43"
rm -f "/usr/share/nano/ocaml.nanorc
rm -f "/usr/share/nano/patch.nanorc"
rm -f "/usr/share/nano/perl.nanorc"
rm -f "/usr/share/nano/php.nanorc"
rm -f "/usr/share/nano/po.nanorc"
rm -f "/usr/share/nano/postgresql.nanorc"
rm -f "/usr/share/nano/pov.nanorc"
rm -f "/usr/share/nano/python.nanorc"
rm -f "/usr/share/nano/ruby.nanorc"
rm -f "/usr/share/nano/rust.nanorc"
rm -f "/usr/share/nano/sh.nanorc"
rm -f "/usr/share/nano/spec.nanorc"
rm -f "/usr/share/nano/tcl.nanorc"
rm -f "/usr/share/nano/tex.nanorc"
rm -f "/usr/share/nano/texinfo.nanorc"
rm -f "/usr/share/nano/xml.nanorc"

rm -rf /usr/share/nano
rm -f /usr/bin/nano
rm -f /usr/bin/rnano
rm -rf /usr/lib/.build-id
rm -rf /usr/share/doc/nano
rm -f "/usr/share/man/man1/nano.1.gz"
rm -f "/usr/share/man/man1/rnano.1.gz"
rm -f "/usr/share/man/man5/nanorc.5.gz"
