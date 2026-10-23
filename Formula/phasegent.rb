class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.29.0/phasegent-v2.29.0-aarch64-apple-darwin"
      sha256 "cc45f06634109e6ae2c51f9649a8d9bdaae01b708f232270af71ff193b6d613b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.29.0/phasegent-v2.29.0-aarch64-unknown-linux-gnu"
      sha256 "31290296727cf9595c4d3e9340d117ffb2b4a101937603a6b1c50a097f24113c"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.29.0/phasegent-v2.29.0-x86_64-unknown-linux-gnu"
      sha256 "b42123e2a5660f49925d516d25f1b8b74938fa1b3672f860a79913b84be70b20"
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
