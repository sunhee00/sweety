package kr.sunny.sweety.main.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.sunny.sweety.main.entity.MainProductModel;

@Mapper
public interface MainMapper {
	public List<MainProductModel> getNewProduct();
}
