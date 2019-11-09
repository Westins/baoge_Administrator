package com.cappuccino.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.poifs.storage.BATBlock.BATBlockAndIndex;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cappuccino.pojo.Goods;
import com.cappuccino.service.GoodsMapperService;
import com.google.gson.Gson;

@Controller
@RequestMapping("/")
public class GoodsServlet {

	@Autowired
	GoodsMapperService goodsService;

	//查询所有的商品
	@RequestMapping("/selAllGoods")
	public void gotAllGoods(HttpServletResponse response, String goodsName, String startDate, String endDate,
			String chooseUD, String chooseUDp) {
		response.setContentType("text/html; charset=utf-8");
		List<Goods> list = goodsService.selAllGoods(goodsName, startDate, endDate, chooseUD, chooseUDp);
		Gson g = new Gson();
		String allGoods = g.toJson(list);
		System.out.println(allGoods.toString());

		try {
			response.getWriter().print(allGoods);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@RequestMapping("/upGoodsState")
	public void upGoodsdel(HttpServletResponse response, String goodsId) {
		response.setContentType("text/html; charset=utf-8");
		int delCount = goodsService.upGoodsState(goodsId);
		if (delCount > 0) {
			try {
				response.getWriter().print("1");// 删除成功
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (delCount <= 0) {
			try {
				response.getWriter().print("2");// 删除失败
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	//（删除）修改商品的状态为4
	@RequestMapping("/upGoodsMaryDel")
	public void upGoodsMaryDel(HttpServletResponse response, String goodsIds) {
		response.setContentType("text/html; charset=utf-8");
		int upDlCount = 0;
		String[] goodsId = goodsIds.split(",");
		for (int i = 0; i < goodsId.length; i++) {
			int dlDlCount = goodsService.upGoodsState(goodsId[i]);
			upDlCount += dlDlCount;
		}

		if (upDlCount >= goodsId.length) {
			try {
				response.getWriter().print("1");// 删除成功
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (upDlCount > 0) {
			try {
				response.getWriter().print("3");// 部分删除失败
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else if (upDlCount <= 0) {
			try {
				response.getWriter().print("2");// 删除失败
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	//对商品进行封禁处理
	@RequestMapping("/upGoodsStop")
	public void upGoodsStop(HttpServletResponse response, String goodsId) {
		response.setContentType("text/html; charset=utf-8");
		int stopCount = goodsService.upGoodsStop(goodsId);
		if (stopCount > 0) {
			try {
				response.getWriter().print("1");// 封禁成功
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (stopCount <= 0) {
			try {
				response.getWriter().print("2");// 封禁失败
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	//对封禁商品进行恢复处理
	@RequestMapping("/upGoodsStart")
	public void upGoodsStart(HttpServletResponse response, String goodsId) {
		response.setContentType("text/html; charset=utf-8");
		int startCount = goodsService.upGoodsStart(goodsId);
		if (startCount > 0) {
			try {
				response.getWriter().print("1");// 解禁成功
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (startCount <= 0) {
			try {
				response.getWriter().print("2");// 解禁失败
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	//审核商品通过
	@RequestMapping("/upGoodsAdopt")
	public void upGoodsUpper(HttpServletResponse response, String goodsId) {
		response.setContentType("text/html; charset=utf-8");
		int startCount = goodsService.upGoodsStart(goodsId);
		if (startCount > 0) {
			try {
				response.getWriter().print("1");// 审核通过成功
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (startCount <= 0) {
			try {
				response.getWriter().print("2");// 审核通过失败
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	
	//查询所有的商品数
	@RequestMapping("/selCount")
	public void selCount(HttpServletResponse response, String goodsId) {
		response.setContentType("text/html; charset=utf-8");
		int count = goodsService.selCount();

		try {
			response.getWriter().print(count);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	//查询排行前十的商品
	@RequestMapping("/selTenGoods_SV")
	public void selTenGoods(HttpServletResponse response) {
		response.setContentType("text/html; charset=utf-8");
		List<Goods>list = goodsService.selTenGoods();
		Gson g = new Gson();
		String tenGoods = g.toJson(list);
		System.out.println(tenGoods.toString());
		try {
			response.getWriter().print(tenGoods);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	@RequestMapping("/selAllMoney")
	public void selAllMoney(HttpServletResponse response) {
		response.setContentType("text/html; charset=utf-8");
		int allMoney = goodsService.selAllMoney();
	
		try {
			response.getWriter().print(allMoney);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//查询所有的未完成
	@RequestMapping("/selAllNotInformationGoods")
	public void selAllNotInformation(HttpServletResponse response) {
		response.setContentType("text/html; charset=utf-8");
		int shopsCount = goodsService.selAllNotInformationShops();
		int GoodsCount = goodsService.selAllNotInformationGoods();
		int allcount = shopsCount+GoodsCount;
		try {
			response.getWriter().print(allcount);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//查询本网站的所有的待发货订单数
	@RequestMapping("/selNotOrders")
	public void selNotOrders(HttpServletResponse response) {
		response.setContentType("text/html; charset=utf-8");
		int notOrder = goodsService.selNotOrders();

		try {
			response.getWriter().print(notOrder);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//查询已完成的订单数
	@RequestMapping("/selWcOrders")
	public void selWcOrders(HttpServletResponse response) {
		response.setContentType("text/html; charset=utf-8");
		int wcOrder = goodsService.selWcOrders();

		try {
			response.getWriter().print(wcOrder);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//查询未完成的订单数
	@RequestMapping("/selNoOrders")
	public void selNoOrders(HttpServletResponse response) {
		response.setContentType("text/html; charset=utf-8");
		int noOrder = goodsService.selNoOrders();
		
		try {
			response.getWriter().print(noOrder);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//查询待审核中的促销商品
	@RequestMapping("/selPromotedGoods")
	public void selPromotedGoods(HttpServletResponse response) {
		response.setContentType("text/html; charset=utf-8");
		int proOrder = goodsService.selPromotedGoods();
		
		try {
			response.getWriter().print(proOrder);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//查询已发布的促销商品数
	@RequestMapping("/selPromotGoods")
	public void selPromotGoods(HttpServletResponse response) {
		response.setContentType("text/html; charset=utf-8");
		int proOrder = goodsService.selPromotGoods();
		
		try {
			response.getWriter().print(proOrder);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

}
