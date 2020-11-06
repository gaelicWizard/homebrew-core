class Chars < Formula
  desc "Command-line tool to display information about unicode characters"
  homepage "https://github.com/antifuchs/chars/"
  url "https://github.com/antifuchs/chars/archive/v0.5.0.tar.gz"
  sha256 "5e2807b32bd75862d8b155fa774db26b649529b62da26a74e817bec5a26e1d7c"
  license "MIT"
  head "https://github.com/antifuchs/chars.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "4d56b107586689744485ede26f55a0916fe09bfa2e9ec27a250c9da3764f5e42" => :catalina
    sha256 "d4bd08669fb838fb8773e4131fd71b972662299ac3c03ff6d83802c6e3d14efc" => :mojave
    sha256 "2dbec73c5adcc494e0932921f015e69b7b7bd8b1d1b29f7ea08bc56da029c9a0" => :high_sierra
  end

  depends_on "rust" => :build

  def install
    cd "chars" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    output = shell_output "#{bin}/chars 1C"
    assert_match /control character/i, output
    assert_match /FS/, output
    assert_match /File Separator/, output
  end
end
