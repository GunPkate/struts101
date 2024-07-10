package action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import connection.ConnectionDB;
import model.ProductVariant;
import java.util.List;

public class LoadProductVariant extends BaseAction{
	private Map <String,Object> variant = new HashMap<String,Object>();
	public List<ProductVariant> productVariantList;
	
	public String filterProductVariant() throws ClassNotFoundException, SQLException {
		try {
			HttpServletRequest req = getRequestServ();
			String[] inputId = req.getParameterValues("id");
			String[] searchInput = req.getParameterValues("searchInput");
			Connection conn = ConnectionDB.DB();
			productVariantList = queryProductV(conn,inputId[0],searchInput[0]); 
			variant.put("variant", productVariantList);
			conn.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "success";
	}
	
	public List<ProductVariant> queryProductV(Connection conn,String id,String search) throws SQLException{
		ArrayList<ProductVariant> temp = new ArrayList<ProductVariant>();
		try {
			String query = "select * from product_variant pv where product_code = '" + id + "'";
//			if(search != null || !search.equals("") ) query += " where product_code = '" + search + "';";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				ProductVariant pv = new ProductVariant();
				pv.setId(rs.getString("id"));
				pv.setColor_code(rs.getString("color_code"));
				pv.setColor(rs.getString("color"));
				pv.setRemains(rs.getInt("remains"));
				pv.setSize(rs.getString("size"));
				temp.add(pv);
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		return temp;
	}

	public Map<String, Object> getVariant() {
		return variant;
	}

	public void setVariant(Map<String, Object> variant) {
		this.variant = variant;
	}

	public List<ProductVariant> getProductVariantList() {
		return productVariantList;
	}

	public void setProductVariantList(List<ProductVariant> productVariantList) {
		this.productVariantList = productVariantList;
	}
	
	
}