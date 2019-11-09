package com.cappuccino.controller;

import java.io.IOException;
import java.net.HttpCookie;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cappuccino.pojo.*;
import com.cappuccino.service.UserInfoMapperService;
import com.google.gson.Gson;

@Controller("UserInfoServlet")
@RequestMapping("/UserInfo")
public class UserInfoServlet {
	
	@Autowired
	UserInfoMapperService userService;
	
	
	//管理员后台登陆
	@RequestMapping("/loginInfo")
	public void login(String userAccount,String userPwd,HttpServletResponse response,HttpServletRequest request,Model mo) {
		
		response.setContentType("text/html; charset=utf-8");
		UserInfo user = userService.selByUserGL(userAccount);
		
		if (null!=user) {
			if (user.getUserPwd().equals(userPwd)) {
				try {
					
					HttpSession session = request.getSession();
					session.setAttribute("user", user);				
					
					response.getWriter().print(1);//登陆成功
				
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else {
				try {
					response.getWriter().print(2);//登陆失败
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
			
		}else{
			try {
				response.getWriter().print(2);//登陆失败
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}	
		
	}
	
	
	//页面查询显示所有的注册使用的用户，并可局部查询部分用户
	@RequestMapping("/selAllUser")
	public void selAllUser(Model mo,HttpServletResponse response,String userName,String startDate,String endDate) {

		System.out.println(userName);
		List<UserInfo>userList= userService.selAllUser(userName,startDate,endDate);
		Gson g = new Gson();
		String allUser = g.toJson(userList);
		System.out.println(allUser.toString());
		response.setContentType("text/html; charset=utf-8");
		try {
			response.getWriter().print(allUser);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//对用户进行删除操作(修改状态)
	@RequestMapping("/upUserState")
	public void upUserState(String userId,HttpServletResponse response) {
		response.setContentType("text/html; charset=utf-8");
		int delCount = userService.upUserState(userId);
		if (delCount>0) {
			try {
				userService.upUserShopStop(userId);				
				response.getWriter().print(1);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if(delCount<=0) {
			try {
				response.getWriter().print(2);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	//对停用的用户进行启用操作
	@RequestMapping("/upUserStart")
	public void upUserStart(String userId,HttpServletResponse response) {
		
		response.setContentType("text/html; charset=utf-8");
		int hFCount = userService.upUserStart(userId);
		if (hFCount>0) {
			try {
				response.getWriter().print(1);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if(hFCount<=0) {
			try {
				response.getWriter().print(2);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	
	//对正常的用户进行停用操作
	@RequestMapping("/upUserStop")
	public void upUserStop(String userIds,HttpServletResponse response) {
		
		response.setContentType("text/html; charset=utf-8");
		int dyCount=0;
		String[] userId = userIds.split(",");
		for (int i=0;i<userId.length;i++) {
			int mddelCount= userService.upUserStop(userId[i]);
			dyCount+=mddelCount;
		}
		
		if (dyCount>=userId.length) {
			try {
				for (int i = 0; i < userId.length; i++) {
					userService.upUserShopStop(userId[i]);	
				}		
				response.getWriter().print(1);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(dyCount>0) {
			try {
				response.getWriter().print(3);//部分删除成功
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		} else if(dyCount<=0) {
			try {
				response.getWriter().print(2);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	
	//创建一个专门根据id查询信息的方法
	@RequestMapping("/selUserById")
	public void selUserById(String userId,HttpServletResponse response) {
		
		response.setContentType("text/html; charset=utf-8");
		System.out.println(userId);
		UserInfo userInfo = userService.selUserById(userId);
		Gson g = new Gson();
		String user = g.toJson(userInfo);
		System.out.println(user.toString());
		response.setContentType("text/html; charset=utf-8");
		try {
			response.getWriter().print(user);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	//用户信息进行编辑操作
		@RequestMapping("/upByIdUser")
		public void upByIdUser(String userId,String userName,String userSex,String userPhone,String userState,HttpServletResponse response) {
			
			response.setContentType("text/html; charset=utf-8");
			int upCount = userService.upByIdUser(userId, userName, userSex, userPhone, userState);
			if (upCount>0) {
				try {
					response.getWriter().print(1);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else if(upCount<=0) {
				try {
					response.getWriter().print(2);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}
		
		//多删操作
		@RequestMapping("/mdDelUser")
		public void mdDelUser(String userIds,HttpServletResponse response) {
			response.setContentType("text/html; charset=utf-8");
			int delCount=0;
			String[] userId = userIds.split(",");
			for (int i=0;i<userId.length;i++) {
				int mddelCount= userService.upUserState(userId[i]);
				delCount+=mddelCount;
			}
		
			if (delCount>=userId.length) {
				try {
					for (int i = 0; i < userId.length; i++) {
						userService.upUserShopStop(userId[i]);	
					}	
					response.getWriter().print(1);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else if(delCount>0) {
				try {
					response.getWriter().print(3);//部分删除成功
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			} else if(delCount<=0) {
				try {
					response.getWriter().print(2);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}
		
		//这是查询本网站的所有管理员的查询方法
		@RequestMapping("/selAllAdmin")
		public void selAdmin(String userName,HttpServletResponse response) {
			response.setContentType("text/html; charset=utf-8");
			List<UserInfo>userList= userService.selAllAdmin(userName);
			Gson g = new Gson();
			String allAdmin = g.toJson(userList);
			System.out.println(allAdmin.toString());
			response.setContentType("text/html; charset=utf-8");
			
			try {
				response.getWriter().print(allAdmin);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		//这是恢复被关闭的管理员方法
		@RequestMapping("/upAdaminStart")
		public void upAdaminStart(String userId,HttpServletResponse response) {
			response.setContentType("text/html; charset=utf-8");
			int startCount= userService.upUserStart(userId);
			response.setContentType("text/html; charset=utf-8");
			
			if (startCount>0) {
				try {
					response.getWriter().print(1);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else if(startCount<=0) {
				try {
					response.getWriter().print(2);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		//这是关闭管理员的
		@RequestMapping("/upAdaminStop")
		public void upAdaminStop(String userId,HttpServletResponse response) {
			response.setContentType("text/html; charset=utf-8");
			int stopCount= userService.upUserStop(userId);
			if (stopCount>0) {
				try {
					response.getWriter().print(1);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else if(stopCount<=0) {
				try {
					response.getWriter().print(2);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		
		//对管理员进行删除操作(修改状态)
		@RequestMapping("/upAdminState")
		public void upAdminState(String userId,HttpServletResponse response) {
			response.setContentType("text/html; charset=utf-8");
			int delCount = userService.upUserState(userId);
			if (delCount>0) {
				try {
					userService.upUserShopStop(userId);				
					response.getWriter().print(1);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else if(delCount<=0) {
				try {
					response.getWriter().print(2);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}
		
		
		//添加普通管理员
		@RequestMapping("/addAdmin")
		public void addAdmin(HttpServletResponse response,UserInfo userInfo) {
			response.setContentType("text/html; charset=utf-8");
			Date date = new Date();
			SimpleDateFormat sDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String userRegTime=sDateFormat.format(date);
			System.out.println(userRegTime);
			int addCount = userService.addAdmin(userInfo.getUserName(), userInfo.getUserAccount(), userInfo.getUserPwd(),
					userInfo.getUserSex(), userInfo.getUserPhone(), userInfo.getUserEmail(), 1, 
					userInfo.getUserPower(),userRegTime);
			if (addCount>0) {
				try {			
					response.getWriter().print(1);//添加成功
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else if(addCount<=0) {
				try {
					response.getWriter().print(2);//添加失败
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		//这是一个根据管理员id 来查询的数据的方法
		@RequestMapping("/selAdminById")
		public String selAdminById(String userId,Model model) {
			UserInfo userInfo = userService.selUserById(userId);
			System.out.println(userInfo.toString());
			model.addAttribute("adminUser", userInfo);

			return "backstagejsp/Personal_info";
			
		}
		
		
		//修改管理员的相关信息
		@RequestMapping("/upByIdAdmin")
		public void upByIdAdmin(HttpServletResponse response,String username,String sex,String age,String mailbox,String phone,String userId) {
			response.setContentType("text/html; charset=utf-8");
			
			int upCount = userService.upByIdAdmin(username, sex, phone, userId, age, mailbox);
			if (upCount>0) {
				try {			
					response.getWriter().print(1);//修改成功
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else if(upCount<=0) {
				try {
					response.getWriter().print(2);//修改失败
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		//修改用户密码
		@RequestMapping("/upUserPwd")
		public void upUserPwd(HttpServletResponse response,String userPwd,String userId) {
			response.setContentType("text/html; charset=utf-8");
			
			int upCount = userService.upUserPwd(userId, userPwd);
			if (upCount>0) {
				try {			
					response.getWriter().print(1);//修改成功
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else if(upCount<=0) {
				try {
					response.getWriter().print(2);//修改失败
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		

}
