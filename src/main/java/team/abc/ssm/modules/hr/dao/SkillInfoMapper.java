package team.abc.ssm.modules.hr.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import team.abc.ssm.modules.hr.entity.SkillInfo;

public interface SkillInfoMapper {
    int deleteByPrimaryKey(String id);

    int insert(SkillInfo record);

    int insertOrUpdate(SkillInfo record);

    int insertOrUpdateSelective(SkillInfo record);

    int insertSelective(SkillInfo record);

    SkillInfo selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SkillInfo record);

    int updateByPrimaryKey(SkillInfo record);

    int updateBatch(List<SkillInfo> list);

    int batchInsert(@Param("list") List<SkillInfo> list);
}