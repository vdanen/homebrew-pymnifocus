class Pymnifocus < Formula
  include Language::Python::Virtualenv

  desc "OmniFocus MCP server and CLI tool for macOS task management"
  homepage "https://github.com/vdanen/pymnifocus"
  url "https://files.pythonhosted.org/packages/source/p/pymnifocus/pymnifocus-0.1.tar.gz"
  sha256 "b5b41d133d6c99122451408178f6c06c3dce2ddc8f7bc7cb9b0fb11e7aff355b"
  license "MIT"

  depends_on "python@3.13"
  depends_on :macos

  def install
    venv = virtualenv_create(libexec, "python3.13")
    venv.pip_install buildpath
    bin.install_symlink Dir[libexec/"bin/pymnifocus-*"]
    man1.install Dir["man/man1/*.1"]
  end

  test do
    assert_match "usage", shell_output("#{bin}/pymnifocus-query --help 2>&1")
  end
end
