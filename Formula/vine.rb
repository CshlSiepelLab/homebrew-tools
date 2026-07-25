class Vine < Formula
  desc "Variational Inference with Node Embedding"
  homepage "https://github.com/CshlSiepelLab/vine"
  url "https://github.com/CshlSiepelLab/vine/archive/refs/tags/v0.3.5.tar.gz"
  sha256 "874a2a87b4937ee626c5c0381ab71301960d4af051650b46aba156d8b9f7967a"
  license "BSD-3-Clause"

  depends_on "cmake" => :build
  depends_on "phast"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args,
             "-DPHAST_ROOT=#{Formula["phast"].opt_prefix}"
      system "cmake", "--build", "."
      system "cmake", "--install", "."
    end
  end

  test do
    system "#{bin}/vine", "--help"
  end
end
