class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.12/phasegent-v2.21.12-aarch64-apple-darwin"
      sha256 "a53c83ed03433252eebe4f85725921343d83dc551899fe496900c41ae5fd10bf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.12/phasegent-v2.21.12-aarch64-unknown-linux-gnu"
      sha256 "701e669fee45d62aec2bc221d85c886ae7f8dd41a49d4b29a24a76c4801ddaa7"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.12/phasegent-v2.21.12-x86_64-unknown-linux-gnu"
      sha256 "d6119a769fbdfcaf4e5fe8c8fc4cc12ef9c37ff76b91d124315fe448b8ac666f"
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
