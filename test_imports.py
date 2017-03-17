
def test(options, buildout):
    import subprocess

    python = options['python']
    _, err = subprocess.Popen([python, "-c", "import ssl"], stderr=subprocess.PIPE).communicate()
    if err:
        raise IOError("Your python doesn't have ssl support, got: %s" % (err, ))
