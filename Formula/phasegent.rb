class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.3/phasegent-v2.21.3-aarch64-apple-darwin"
      sha256 "3943b83767cc90a47b6cb3140f04780ff26e2833114fc09d67fee16dc0c01e84"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.3/phasegent-v2.21.3-aarch64-unknown-linux-gnu"
      sha256 "a3f275387af8d80f7cb882e5dd769dc3794d9f55279dd3044755a79c80ae5d10"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.3/phasegent-v2.21.3-x86_64-unknown-linux-gnu"
      sha256 "0baeca0178b51b582d50f3742e642eac758a281e00b6961f22b33346810b8164"
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
