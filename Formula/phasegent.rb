class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.31.0/phasegent-v2.31.0-aarch64-apple-darwin"
      sha256 "a77eaa895945d8445d1ebaf292d6d2f3c291bf369284e9732809f7199abd14b5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.31.0/phasegent-v2.31.0-aarch64-unknown-linux-gnu"
      sha256 "b44f5a96a944496f9517f8ff29e52cf7fec19b1c9bf384ab6c4a059cbe735248"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.31.0/phasegent-v2.31.0-x86_64-unknown-linux-gnu"
      sha256 "1c5c03e2e60837470667a640a86311242314b26c2fc211d948988972f5875fd9"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin.install Dir["phasegent-*"].first => "phasegent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phasegent --version")
  end
end
