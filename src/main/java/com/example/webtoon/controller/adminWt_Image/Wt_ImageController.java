package com.example.webtoon.controller.adminWt_Image;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.webtoon.model.webtoon_image.dto.Webtoon_ImageDTO;
import com.example.webtoon.service.webtoon_Image.Webtoon_ImageService;
import com.example.webtoon.util.path.FilePath;

@Controller
public class Wt_ImageController {

	@Inject
	Webtoon_ImageService wt_imageService;

	@RequestMapping("/adminPage/wt_imageSeries")
	public String wt_imageSetting(@RequestParam String title, @RequestParam int no, Model model,HttpSession session
) throws Exception {
		// title =URLEncoder.encode(title,"utf-8");
		  String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }
		List<Webtoon_ImageDTO> list = wt_imageService.webtoonList(title, no);
		model.addAttribute("wt_image", list);
		model.addAttribute("title", title);
		model.addAttribute("no", no);
		return "adminPage/wt_Image_Setting/wt_imageSeries";
	}

	// 사진 업로드
	@RequestMapping("/adminPage/image_upload")
	public String wt_imageUpload(@RequestParam MultipartFile[] file, @RequestParam String title, @RequestParam int no,
			Model model, HttpSession session) {
		  String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }
		int count = 0;
		String filename[] = new String[file.length];
		String path = FilePath.path(session, "/WEB-INF/views/webtoons/" + title + "/" + no + "/");
		File tempFile[] = new File[file.length];

		// 파일의 최대값이 무엇인지 조사하기위한 값들
		int maxcount = 300;
		File tempFile2 = null;
		int maxValue = 0;
		// 파일 최대값 조사
		for (int i = 0; i < maxcount; i++) {
			tempFile2 = new File(path + i + ".jpg");
			if (tempFile2.exists()) {
				maxValue = i;
			}
		}

		// 현재디렉토리에 있는 파일 갯수 알아내기
		// 방법을 몰라서 설정을 못함;

		// 파일 업로드 했다면
		for (int i = 0; i < file.length; i++) {
			// 파일 업로드했는지 검사
			if (!file[i].isEmpty()) {
				count++;
			}
		}

		try {
			// 모든 파일 업로드했다고 판결이되면 수행
			if (count == file.length) {
				// 파일 이름 찎어봄
				for (int i = 0; i < file.length; i++) {
					filename[i] = file[i].getOriginalFilename();

					// 파일이름을 최대값~length로 줌
					filename[i] = String.valueOf(maxValue + i + 1);
					// 임시 파일만듬
					tempFile[i] = new File(path + filename[i] + ".jpg");

				}

				// 존재하는 이름이면 +1을 하고 만든다
				for (int i = 0; i < file.length; i++) {

					// 파일 존재시
					while (tempFile[i].exists()) {
						// 더하기 일을하고만듬
						
						filename[i] = String.valueOf(Integer.valueOf(filename[i]) + 1);
						tempFile[i] = new File(path + filename[i] + ".jpg");
					}

					// 존재하지않는 디렉토리인경우 생성
					new File(path).mkdir();
					// 파일 없다면 만듬
					file[i].transferTo(new File(path + filename[i] + ".jpg"));

					// 그리고 dto에 저장을 함!!!
					// 인서트함
					int image = Integer.valueOf(filename[i]);
					wt_imageService.wt_imageInsert(title, no, image);
				}
			} else {
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 다시 시리즈 목록 띄워줌
		List<Webtoon_ImageDTO> list = wt_imageService.webtoonList(title, no);
		model.addAttribute("wt_image", list);
		model.addAttribute("title", title);
		model.addAttribute("no", no);
		return "adminPage/wt_Image_Setting/wt_imageSeries";
	}

	// 이미지 개별 수정하기
	@RequestMapping("/adminPage/wt_imageUpdate")
	public String wt_imageupdate(@RequestParam int idx, Model model,HttpSession session
) {
		  String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }
		// 해당 idx정보 가져옴
		Webtoon_ImageDTO dto = wt_imageService.wt_imageUpdate(idx);
		model.addAttribute("wt_imageInfo", dto);
		

		// 저장되있는 이미지번호 받아오기
		List<Integer> list = wt_imageService.wt_imageList(dto.getTitle(), dto.getNo());
		model.addAttribute("imageList", list);


		return "adminPage/wt_Image_Setting/wt_imageUpdate";
	}

	// 이미지를 수정함
	@RequestMapping("adminPage/wt_imageUpdate.do")
	public String wt_imageUpdateDo(@ModelAttribute Webtoon_ImageDTO dto, HttpSession session,
			@RequestParam int beforeImage, Model model) throws Exception {
		  String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }
		// 기존에있던 파일이름
		String path = FilePath.path(session, "/WEB-INF/views/webtoons/" + dto.getTitle() + "/" + dto.getNo() + "/");
		File file = new File(path + beforeImage + ".jpg");

		if (!dto.getFile().isEmpty()) {
			try {
				// 기존 이미지 삭제
				if (file.exists()) {
					file.delete();
				}
				// 현재이미지 생성
				dto.getFile().transferTo(new File(path + dto.getImage() + ".jpg"));

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			// 파일 업로드를 하지않았다면

			try {
				// 현재이미지 재생성(복사)
				System.out.println("복사합니다..");
				File file2 = new File(path + dto.getImage() + ".jpg");
				FileCopyUtils.copy(file, file2);

				// 기존 이미지 삭제
				if (beforeImage != dto.getImage()) {
					file.delete();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		// String title = URLEncoder.encode(dto.getTitle(), "utf-8");
		String title = dto.getTitle();
		wt_imageService.wt_imageUpdateDo(dto);

		// 다시 목록뿌려줌
		List<Webtoon_ImageDTO> list = wt_imageService.webtoonList(title, dto.getNo());
		model.addAttribute("wt_image", list);
		model.addAttribute("title", title);
		model.addAttribute("no", dto.getNo());
		return "adminPage/wt_Image_Setting/wt_imageSeries";
	}

	// 이미지 삭제
	@RequestMapping("/adminPage/wt_imageDelete.do")
	public String wt_imageDelete(Model model, @RequestParam int idx, @RequestParam String title, @RequestParam int no,
			@RequestParam int image,HttpSession session) {

		// 존재하는 파일삭제
		  String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }
		try {
			String path = FilePath.path(session, "/WEB-INF/views/webtoons/" + title + "/" + no + "/");
			File file = new File(path+image+".jpg");
			if(file.exists()){
				file.delete();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 삭제
		wt_imageService.wt_imageDelete(idx);

		// 리스트를 다시~뿌려줘어~
		List<Webtoon_ImageDTO> list = wt_imageService.webtoonList(title, no);
		model.addAttribute("wt_image", list);
		model.addAttribute("title", title);
		model.addAttribute("no", no);
		return "adminPage/wt_Image_Setting/wt_imageSeries";
	}

}
