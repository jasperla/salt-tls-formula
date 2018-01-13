================
tls-formula
================

This is a Saltstack formula to handle the installation of TLS certificates and keys.
It comes with sane defaults for ease of use and security. For example it will install
keys with a default mode of ``0600``.

.. note::

    See `my blog <https://blog.jasper.la/salt-managed-tls-files.html>`_ for more information.

Available states
================

.. contents::
    :local:

``tls``
------------

Installs any certificates, keys and chains found as Pillar data.
