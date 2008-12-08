package Angelos::Dispatcher::Dispatch;
use Mouse;

has 'match' => (
    is       => 'rw',
    required => 1,
);

no Mouse;

sub run {
    my ( $self, $c ) = @_;
    my $match      = $self->match;
    my $controller = $match->params->{controller};
    my $action     = $match->params->{action};
    my $params     = $match->params;
    my $instance   = $c->controller($controller);

    # FIXME: move to the view?
    # which class should have match information?  Should we refer it from the view?
    $c->stash->{template} = join '/', split(/-/, $controller), $action;

    $instance->$action( $c, $params );
}

sub has_matches {
    my $self = shift;
    $self->match ? 1 : 0;
}

__PACKAGE__->meta->make_immutable;

1;
