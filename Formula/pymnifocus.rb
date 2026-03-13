class Pymnifocus < Formula
  desc "OmniFocus MCP server and CLI tool for macOS task management"
  homepage "https://github.com/vdanen/pymnifocus"
  url "https://files.pythonhosted.org/packages/source/p/pymnifocus/pymnifocus-0.1.tar.gz"
  sha256 "46409247794684ed98de127ef4b876e48fc35ba2e0383717120d27a2c819ed8f"
  license "MIT"

  depends_on "python@3.13"
  depends_on :macos

  def install
    python3 = Formula["python@3.13"].opt_bin/"python3.13"
    system python3, "-m", "venv", "--clear", libexec
    ENV.delete("PIP_NO_BINARY")
    ENV.delete("PIP_REQUIRE_HASHES")
    system libexec/"bin/pip", "install", "--upgrade", "pip"
    system libexec/"bin/pip", "install", "."
    bin.install_symlink Dir[libexec/"bin/pymnifocus-*"]
    man1.install Dir["man/man1/*.1"]
  end

  test do
    assert_match "usage", shell_output("#{bin}/pymnifocus-query --help 2>&1")
  end
end
