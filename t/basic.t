#!perl -T
use lib qw(t/lib);
use DBICTest;
use Test::More tests => 3;
use Mojo::URL;
 
my $schema = DBICTest->init_schema();
 
my $rs = $schema->resultset('Things');

my $fetched = $rs->find(1);

isa_ok($fetched->url, 'Mojo::URL', 'url inflated to right class');

my $created = Mojo::URL->new();
$created->scheme('http');
$created->host('www.yahoo.com');

my $crf = $rs->create( { url => $created });
isa_ok($crf, 'DBICTest::Schema::Things', 'create with object');
is($crf->get_column('url'), 'http://www.yahoo.com', 'url correctly deflated');
