class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.32.11/phasegent-v2.32.11-aarch64-apple-darwin"
      sha256 "d0e98f10eeb0c42d571966b98992e1b794cc6d919543a378200767682813a573"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.32.11/phasegent-v2.32.11-x86_64-unknown-linux-musl"
      sha256 "9b45c81d9a714b41bb9bacb916f18c614ce2e6f1df26ae2dd99057e2f40579df"
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
