class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.33.0/phasegent-v2.33.0-aarch64-apple-darwin"
      sha256 "e3b8352ab901fe49c926630f1eb4a33a018f7b3af353f70b43f87e2ae51233a3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.33.0/phasegent-v2.33.0-x86_64-unknown-linux-musl"
      sha256 "1fc82f3ed4341abb2764b54a0342ce3b8e4f9e460f20816204bb398d5490ea09"
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
