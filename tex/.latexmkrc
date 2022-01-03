$pdf_mode = 1;
$dvi_mode = $postscript_mode = 0;
$pdflatex = 'lualatex %O %S';
$out_dir = 'output';
add_cus_dep('mp', '1', 0, 'mpost');
sub mpost {
    my $file = $_[0];
    my ($name, $path) =  fileparse( $file );
    pushd( $path );
    my $return = system "mpost $name" ;
    popd();
    return $return;
}
@default_files = ( 'advexpv', 'advexpvtn', 'answers', 'egcarsg', 'egcarsx', 'egspec', 'exercises', 'expv', 'expvtn', 'grexpv', 'grexpvtn', 'mpxerr', 'principlesv', 'rulesv', 'rulesvtn' )
