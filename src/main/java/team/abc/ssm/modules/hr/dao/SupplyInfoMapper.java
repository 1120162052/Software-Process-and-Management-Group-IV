package team.abc.ssm.modules.hr.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import team.abc.ssm.modules.hr.entity.SupplyInfo;

public interface SupplyInfoMapper {
    int deleteByPrimaryKey(String id);

    int insert(SupplyInfo record);

    int insertOrUpdate(SupplyInfo record);

    int insertOrUpdateSelective(SupplyInfo record);

    int insertSelective(SupplyInfo record);

    SupplyInfo selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SupplyInfo record);

    int updateByPrimaryKey(SupplyInfo record);

    int updateBatch(List<SupplyInfo> list);

    int batchInsert(@Param("list") List<SupplyInfo> list);
}