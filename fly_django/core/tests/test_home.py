from http import HTTPStatus


from django.shortcuts import resolve_url


def test_home_ok(client):

    resp = client.get(resolve_url('core:home'))

    assert resp.status_code == HTTPStatus.OK