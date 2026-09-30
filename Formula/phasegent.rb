class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.4/phasegent-v2.21.4-aarch64-apple-darwin"
      sha256 "c5d1b70a014001e4a159e1d849c58fe77aa4274a323200c0f772abce46ad45e9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.4/phasegent-v2.21.4-aarch64-unknown-linux-gnu"
      sha256 "6a0d9fe6628be094abb0bc6076b6196b62b4e993c3d26ccca35aa76452ef45cc"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.4/phasegent-v2.21.4-x86_64-unknown-linux-gnu"
      sha256 "18db7614fa8baea622250542bf410ae17189b869bdb374266c38724ecf9af4fd"
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
