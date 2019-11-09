package com.cappuccino.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cappuccino.pojo.Count;
import com.cappuccino.pojo.Shops;
import com.cappuccino.service.ShopsMapperService;
import com.cappuccino.service.UserInfoMapperService;
import com.google.gson.Gson;

@Controller("ShopsServlet")
@RequestMapping("/Shops")
public class ShopsServlet {

	@Autowired
	ShopsMapperService shopsService;

	// 查询所有的商铺&&具有查询功能
	@RequestMapping("/selAllShops")
	public void selAllShops(HttpServletResponse response, String shopName, String shopSV) {

		response.setContentType("text/html; charset=utf-8");
		List<Shops> shopList = shopsService.getAllShops(shopName, shopSV);
		Gson g = new Gson();
		String allShop = g.toJson(shopList);
		System.out.println(allShop.toString());

		try {
			response.getWriter().print(allShop);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 分步查询了该商铺内所有的商品数量
	@RequestMapping("/selGoodsCount")
	public void selGoodsCount(HttpServletResponse response, String shopIds) {
		response.setContentType("text/html; charset=utf-8");

		List<Integer> goodscount = new ArrayList();
		String[] shopId = shopIds.split(",");
		for (int i = 0; i < shopId.length; i++) {
			int goodsCount = shopsService.selGoodsCount(shopId[i]);
			goodscount.add(goodsCount);
		}
		/*
		 * Gson g = new Gson(); String goodsCounts = g.toJson(goodscount);
		 * System.out.println(goodsCounts);
		 */

		try {
			response.getWriter().print(goodscount);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 对有违规或其他原因的商铺进行下架，停用处理
	@RequestMapping("/upShopsStop")
	public void upShopsStop(HttpServletResponse response, String shopId) {
		response.setContentType("text/html; charset=utf-8");
		// int dyCount=0;
		int upCount = shopsService.upShopsStop(shopId);

		if (upCount > 0) {
			try {
				shopsService.upFJshopGoods(shopId);
				response.getWriter().print(1);// 下架成功
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (upCount <= 0) {
			try {
				response.getWriter().print(2);// 下架失败
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}

	// 对有其下架的商铺进行上架恢复操作
	@RequestMapping("/upShopsStart")
	public void upShopsStart(HttpServletResponse response, String shopId) {
		response.setContentType("text/html; charset=utf-8");
		int upCount = shopsService.upShopsStart(shopId);
		if (upCount > 0) {
			try {
				response.getWriter().print(1);// 上架成功
				shopsService.upHFshopGoods(shopId);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (upCount <= 0) {
			try {
				response.getWriter().print(2);// 上架失败
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}

	// 对商铺进行单删除操作
	@RequestMapping("/upDlshopsStateDs")
	public void upDlshopsStateDs(HttpServletResponse response, String shopId) {
		response.setContentType("text/html; charset=utf-8");
		int upDlCount = 0;
		String[] shopIds = shopId.split(",");
		for (int i = 0; i < shopIds.length; i++) {
			int dlDlCount = shopsService.upDlshopsState(shopIds[i]);
			upDlCount += dlDlCount;
		}

		if (upDlCount >= shopIds.length) {
			try {
				response.getWriter().print(1);// 删除成功
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (upDlCount > 0) {
			try {
				response.getWriter().print(3);// 部分删除失败
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (upDlCount <= 0) {
			try {
				response.getWriter().print(2);// 删除失败
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	// 对商铺进行删除操作
	@RequestMapping("/upDlshopsState")
	public void upDlshopsState(HttpServletResponse response, String shopIds) {
		response.setContentType("text/html; charset=utf-8");
		int upDlCount = 0;
		String[] shopId = shopIds.split(",");
		for (int i = 0; i < shopId.length; i++) {
			int upCount = shopsService.upDlshopsState(shopId[i]);
			upDlCount += upCount;
		}

		if (upDlCount >= shopId.length) {
			try {
				response.getWriter().print(1);// 删除成功
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (upDlCount > 0) {
			try {
				response.getWriter().print(3);// 部分删除成功
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else if (upDlCount <= 0) {
			try {
				response.getWriter().print(2);// 删除失败
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	// 对审核商铺进行通过操作
	@RequestMapping("/upShopsAdopt")
	public void upShopsAdopt(HttpServletResponse response, String shopsId) {
		response.setContentType("text/html; charset=utf-8");
		int adoptCount = shopsService.upShopsAdopt(shopsId);

		if (adoptCount > 0) {
			try {
				response.getWriter().print(1);// 通过
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (adoptCount <= 0) {
			try {
				response.getWriter().print(2);// 通过失败
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}

	// 统计网站店铺数
	@RequestMapping("/StatisticsShops")
	public void Statistics(HttpServletResponse response) {
		response.setContentType("text/html; charset=utf-8");

		int statisticsShops = shopsService.selAllShopsCount();

		try {
			response.getWriter().print(statisticsShops);// 通过
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// 查询店铺信息根据id
	@RequestMapping("/selShopsById")
	public void selShopsById(HttpServletResponse response, String shopsId) {

		response.setContentType("text/html; charset=utf-8");
		List<Shops> list = shopsService.selShopsById(shopsId);
		Gson g = new Gson();
		String allShop = g.toJson(list);

		try {
			response.getWriter().print(allShop);// 查询数据
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// 查询店铺下有多少商品
	@RequestMapping("/selByIdshopGoods")
	public void selByIdshopGoods(HttpServletResponse response, String shopsId) {

		response.setContentType("text/html; charset=utf-8");
		int goodsCount = shopsService.selGoodsCount(shopsId);

		try {
			response.getWriter().print(goodsCount);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}

	}
	
	//按审核 关闭状态查询
	@RequestMapping("/selConditionSF")
	public void selConditionSF(HttpServletResponse response,String clickGb,String clickSh) {
		response.setContentType("text/html; charset=utf-8");
		List<Shops> shopList = shopsService.selConditionSF(clickGb, clickSh);
		Gson g = new Gson();
		String allShop = g.toJson(shopList);
		System.out.println(allShop.toString());

		try {
			response.getWriter().print(allShop);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	//查询订单数方法
	@RequestMapping("/selShopsSalesVolume")
	public void selShopsSalesVolume(HttpServletResponse response) {
		
		response.setContentType("text/html; charset=utf-8");
		int allShopsSales = shopsService.selShopsSalesVolume();
	
		try {
			response.getWriter().print(allShopsSales);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	//查询用户所有的评论数方法
	@RequestMapping("/selAllPlcount")
	public void selAllPlcount(HttpServletResponse response) {
		
		response.setContentType("text/html; charset=utf-8");
		int allPl = shopsService.selAllPlcount();
		
		try {
			response.getWriter().print(allPl);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	//查询一周的订单数
	@RequestMapping("/selyi")
	public void selyi(HttpServletResponse response) {
		
		response.setContentType("text/html; charset=utf-8");
		int[] orderCount = new int[7];
		List<Integer>list = new ArrayList();
		List<Integer>list2 = new ArrayList();
		List<Integer>list3 = new ArrayList();
		String[] time = {"2019-6-17","2019-6-18","2019-6-19","2019-6-20","2019-6-21","2019-6-22","2019-6-23"}; 
		for (int i = 0; i < time.length; i++) {
			int orderscount = shopsService.selyi(time[i]);
			list.add(orderscount);
		}
		for (int i = 0; i < time.length; i++) {
			int orderscount = shopsService.seler(time[i]);
			list2.add(orderscount);
		}
		for (int i = 0; i < time.length; i++) {
			int orderscount = shopsService.selsan(time[i]);
			list3.add(orderscount);
		}
		
		
		Count count = new Count();
		count.setList(list);
		count.setList2(list2);
		count.setList3(list3);

			
		Gson gson = new Gson();
		String string= gson.toJson(count);
		System.out.println(string);	
		try {
			response.getWriter().print(string);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	

}
