package # hide from PAUSE
    DBICTest::Schema::Things;
 
use base qw/DBIx::Class/;
 
__PACKAGE__->load_components(qw/InflateColumn::MojoUrl Core/);
__PACKAGE__->table('Things');
 
__PACKAGE__->add_columns(
    id => {
        data_type   => 'int',
        size        => '1',
        is_nullable => 0,
    },
    url => {
        data_type   => 'varchar',
        size        => 255,
        is_nullable => 0,
        is_mojo_url => 1,
    }
);
 
__PACKAGE__->set_primary_key('id');
__PACKAGE__->add_unique_constraint(url => [ qw/url/ ]);
 
1;