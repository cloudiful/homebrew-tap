class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.32.10/phasegent-v2.32.10-aarch64-apple-darwin"
      sha256 "49474c7dfe962bc3e34df759d9fd69333f86b0d8e64881dda6c2829199806fed"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.32.10/phasegent-v2.32.10-x86_64-unknown-linux-musl"
      sha256 "c64e9be8ebf63a6d9a594a44c636b5bb2dcb105280dc3d47807c77355982f209"
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
