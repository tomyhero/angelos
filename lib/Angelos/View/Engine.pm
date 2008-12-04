package Angelos::View::Engine;
use Moose;
use Carp();

has 'engine' => (
    is      => 'rw',
    lazy    => 1,
    builder => 'build_engine',
);

no Moose;

sub render {
    my ( $self, $template, $stash, $args ) = @_;
    Carp::croak('sub class must implement this method!!!');
}

__PACKAGE__->meta->make_immutable;

1;
