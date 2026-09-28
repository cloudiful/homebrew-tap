class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.20.2/phasegent-v2.20.2-aarch64-apple-darwin"
      sha256 "32e48d171bc3d9cbac9905b9c6eabe7b11e1f3acf8421363c82cb946a2114ed6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.20.2/phasegent-v2.20.2-aarch64-unknown-linux-gnu"
      sha256 "618ac7309ff0922aeb56263cf95bc4503635187f138f65138fc101ef89f59f45"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.20.2/phasegent-v2.20.2-x86_64-unknown-linux-gnu"
      sha256 "8c9847c14a18776abf4d86e76ac488eb8eef4cacafd4beacdc49f5d7f076b1d9"
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
