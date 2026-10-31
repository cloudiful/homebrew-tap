class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.32.1/phasegent-v2.32.1-aarch64-apple-darwin"
      sha256 "3b17ca09e048301c753e26fd1ae054d51ec9deafa92ae199941d68695be3996c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.32.1/phasegent-v2.32.1-aarch64-unknown-linux-gnu"
      sha256 "2ff7b7a569fde09dd235801ee814bbaeab4b971d8450f937defdafe5bde17556"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.32.1/phasegent-v2.32.1-x86_64-unknown-linux-gnu"
      sha256 "e6a099268fb3fcf5cb576895fdf6309eaaf0167a30b6bdf0204b619b8f73e8e8"
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
