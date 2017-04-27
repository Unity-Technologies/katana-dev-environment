Install Perl Requirements:
  cmd.run:
    - name: export PERL_MM_USE_DEFAULT=1; cpan LWP::UserAgent; cpan XML::Parser
    - use_vt: True