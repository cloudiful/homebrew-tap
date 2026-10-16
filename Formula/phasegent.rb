class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.28.1/phasegent-v2.28.1-aarch64-apple-darwin"
      sha256 "4e7e3056bb368281b47dcadb0878a51ec30531672f9844991504843866d030d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.28.1/phasegent-v2.28.1-aarch64-unknown-linux-gnu"
      sha256 "1ec285faf3e556b08a7c3fc653a3f0c49d15d934ee9d4e6dc5b4f20e60d9d7c9"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.28.1/phasegent-v2.28.1-x86_64-unknown-linux-gnu"
      sha256 "dd51ec2bf08c8bd0c45f3a071121ea7ed740890adbd621d8ea3e16cb01f7c608"
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
