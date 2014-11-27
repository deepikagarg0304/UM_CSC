/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import beans.CityBean;
import beans.CountryBean;
import beans.StateBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DELL
 */
public class CountryStateCityServices {

    public List<CountryBean> getAllCountries() {
        List<CountryBean> lstCountry = null;
        try (Connection con = ConnectDB.connect();) {
            PreparedStatement pstmt = con.prepareStatement("select * from countrymaster");
            ResultSet rs = pstmt.executeQuery();
            lstCountry = new ArrayList<>();
            while (rs.next()) {
                CountryBean objCountryBean = new CountryBean();
                objCountryBean.setCountryId(rs.getInt("country_id"));
                objCountryBean.setCountryName(rs.getString("country_name"));
                lstCountry.add(objCountryBean);
            }
        } catch (Exception e) {
            System.out.println("In getAllCountries():" + e);
        }
        return lstCountry;

    }

    public List<StateBean> getStatesByCountryId(int countryId) {
        StateBean objStateBean = null;
        List<StateBean> lstStateBean=new ArrayList<>();
        try (Connection con = ConnectDB.connect();) {
            PreparedStatement pstmt = con.prepareStatement("select * from statemaster where country_id=?");
            pstmt.setInt(1, countryId);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                objStateBean = new StateBean();
                objStateBean.setStateId(rs.getInt("state_id"));
                objStateBean.setStateName(rs.getString("state_name"));
                lstStateBean.add(objStateBean);
            }
        } catch (Exception e) {
            System.out.println("In getStateByCountryId():" + e);
        }
        return lstStateBean;
    }

    public List<CityBean> getCitiesByStateId(int stateId) {
        CityBean objCityBean = null;
        List<CityBean> lstCityBean=new ArrayList<>();
        try (Connection con = ConnectDB.connect();) {
            PreparedStatement pstmt = con.prepareStatement("select * from citymaster where state_id=?");
            pstmt.setInt(1, stateId);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                objCityBean = new CityBean();
                objCityBean.setCityId(rs.getInt("city_id"));
                objCityBean.setCityName(rs.getString("city_name"));
                lstCityBean.add(objCityBean);
            }
        } catch (Exception e) {
            System.out.println("In getCityByStateId():" + e);
        }
        return lstCityBean;
    }
}
