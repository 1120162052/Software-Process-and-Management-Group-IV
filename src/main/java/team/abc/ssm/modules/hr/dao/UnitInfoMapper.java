package team.abc.ssm.modules.hr.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import team.abc.ssm.modules.hr.entity.UnitInfo;

public interface UnitInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UnitInfo record);

    int insertOrUpdate(UnitInfo record);

    int insertOrUpdateSelective(UnitInfo record);

    int insertSelective(UnitInfo record);

    UnitInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UnitInfo record);

    int updateByPrimaryKey(UnitInfo record);

    int updateBatch(List<UnitInfo> list);

    int batchInsert(@Param("list") List<UnitInfo> list);
}