class CostoraAgent < Formula
  desc "Metadata-only Costora local agent for PR cost receipts"
  homepage "https://github.com/costora"
  url "https://github.com/0dust/homebrew-costora/releases/download/v0.1.0/costora-agent-release.tar.gz"
  sha256 "593feb99023f3003e6a60f63eba4145a247d6241bc68b61177923c69ff127cf3"
  version "0.1.0"

  depends_on :macos

  def install
    artifact = Hardware::CPU.intel? ? "pr-cost-agent_darwin_amd64" : "pr-cost-agent_darwin_arm64"
    bin.install artifact => "costora-agent"
  end

  test do
    output = shell_output("#{bin}/costora-agent version")
    assert_match "costora-agent", output
    refute_match(/token|secret|api_key|prompt|completion|transcript|raw_jsonl|raw_otel|diff|patch/i, output)
  end
end
